from flask import Flask, render_template

app = Flask(__name__)

# Curiosidade → print('------', type(__name__))
# Curiosidade 2 → '@' se chama decorator

@app.route("/")
def index():
    return render_template("index.html")


@app.route("/sobre")
def sobre():
    return render_template("about.html")


@app.route("/contato")
def contato():
    print("fumaça")
    return "Estamos em contato"


if __name__ == "__main__":
    app.run(debug=True)
