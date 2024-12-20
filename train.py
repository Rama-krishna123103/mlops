# train_model.py
import numpy as np
import pandas as pd
from sklearn.linear_model import LinearRegression
from sklearn.model_selection import train_test_split
from sklearn.metrics import mean_squared_error
import joblib

# Generate dummy data
data = pd.DataFrame({
    "x": np.linspace(0, 10, 100),
    "y": np.linspace(0, 10, 100) + np.random.normal(0, 1, 100)
})

# Features and target
X = data[["x"]]
y = data["y"]

# Split the data
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Train a simple linear regression model
model = LinearRegression()
model.fit(X_train, y_train)

# Test the model
predictions = model.predict(X_test)
mse = mean_squared_error(y_test, predictions)
print(f"Model Mean Squared Error: {mse:.2f}")

# Save the model
joblib.dump(model, "model.pkl")
print("Model saved as model.pkl")
