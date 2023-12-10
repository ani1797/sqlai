import sqlite3 as sql
import sys
from pathlib import Path

from smartai.llm.ollama import Ollama
from smartai.tools.sqlprocessor import SQL

if __name__ == "__main__":
    if len(sys.argv) <= 1:
        print("Usage: python cli.py <question>")
        exit(-1)
    else:
        question = sys.argv[1]
        ai = Ollama("http://ollamaapi.localhost")
        conn = sql.connect("falcon.sqlite")
        sql = SQL(Path("data_dictionary.csv").read_text(), "sqlite", ai_callback=ai.completion, connection=conn)
        print(sql.ask(question, max_retry = 25))
