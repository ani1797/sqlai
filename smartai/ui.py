import sqlite3
from pathlib import Path

import pandas as pd
import streamlit as st
from llm.oai import AOAI
from llm.ollama import Ollama
from tools.sqlprocessor import SQL


def main():
    st.sidebar.title("SQL Assistant")
    model_selection = st.sidebar.selectbox("Select the AI you would like to use", ["Local AI", "Azure OpenAI"])
    if model_selection == "Local AI":
        ai = Ollama("http://ollamaapi.localhost")
        dd = Path("data_dictionary.csv").read_text()
        sql = SQL(dd, "sqlite3", ai.completion, sqlite3.connect("database.sqlite"))
    elif model_selection == "Azure OpenAI":
        ai = AOAI()
        dd = Path("data_dictionary.csv").read_text()
        sql = SQL(dd, "sqlite3", ai.completion, sqlite3.connect("database.sqlite"))
    else:
        raise ValueError(f"Invalid model selection: {model_selection}")
    
    question = st.chat_input("What would you like to know?")
    if question:
        with st.chat_message("user"):
            st.markdown(question)
        with st.spinner("Thinking..."):
            try:
                answer_df = sql.ask(question, max_retry = 25)
                with st.chat_message("assistant"):
                    st.dataframe(answer_df)
            except pd.errors.DatabaseError as e:
                print(e)
                with st.chat_message("assistant"):
                    st.markdown("I'm sorry, I ran into an issue executing your query. Please see logs for more details.")
    
if __name__ == "__main__":
    main()
