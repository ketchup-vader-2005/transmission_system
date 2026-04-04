import numpy as np
import pandas as pd
import tensorflow as tf

# Global variable to keep the model in Python's RAM
model = None

def run_inference():
    global model
    if model is None:
        # Load the model only once
        model = tf.keras.models.load_model("/Users/faizshaikh/Documents/machine_learning/CNNmodel.keras")
    
    f = pd.read_parquet('/Users/faizshaikh/Documents/MATLAB/transmission_system/live_test.parquet')
    print(f.head())

    #This iterates through every simulation, expands the dictionaries, and stacks them
    #X = np.array([pd.DataFrame.from_records(sim).values for sim in f['TransientData']])
    features = ['D6[Va]', 'D6[Vb]', 'D6[Vc]', 'D6[Ia]', 'D6[Ib]', 'D6[Ic]', 'D2[Ia]', 'D2[Ib]', 'D2[Ic]', 'Ig']

    X = np.array([
        pd.DataFrame(
        list(sim))[features].values for sim in f['TransientData']
    ])

    X = X[:, 50:290, :]

    # 3. Predict
    predictions = model.predict(X)
    
    # Return as a list so MATLAB can read it easily
    # (Assuming your model has two outputs: [type_probs, distance])
    # Use [0] to grab the first (and only) row of the prediction
    return [predictions[0][0].tolist(), predictions[1][0].tolist()]