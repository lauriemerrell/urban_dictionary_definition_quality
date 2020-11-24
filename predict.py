import sklearn
import pickle
import os

VECTORIZER_LOCATION = os.environ.get('VECTORIZER_LOCATION', "./models/logistic/logistic_cv.p")
TFIDF_LOCATION = os.environ.get('TFIDF_LOCATION', "./models/logistic/logistic_tfidf.p")
MODEL_LOCATION = os.environ.get('MODEL_LOCATION',"./models/logistic/best_logistic.p")

with open(VECTORIZER_LOCATION, 'rb') as f:
    cv = pickle.load(f)

with open(TFIDF_LOCATION, 'rb') as f:
    tv = pickle.load(f)

with open(MODEL_LOCATION, 'rb') as f:
    model = pickle.load(f)

def classify(text):
    try:
        label = model.predict(tv.transform(cv.transform([text])))[0]
        return label
    except Exception as e:
        return str(e)