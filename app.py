# app.py
from flask import Flask, request, jsonify
import joblib
import numpy as np

# Load the model
model = joblib.load("model.pkl")

# Initialize Flask app
app = Flask(__name__)

@app.route("/")
def home():
    return "Welcome to the ML Model API!"

@app.route("/predict", methods=["POST"])
def predict():
    try:
        # Parse input JSON
        data = request.get_json()
        features = np.array(data["features"]).reshape(1, -1)

        # Make prediction
        prediction = model.predict(features)

        # Return result
        return jsonify({"prediction": prediction.tolist()})
    except Exception as e:
        return jsonify({"error": str(e)})

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
