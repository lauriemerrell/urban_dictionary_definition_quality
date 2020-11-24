from sklearn

TOKENIZER_FILE_LOCATION = os.environ.get('DICT_FILE', "./models/")
MODEL_LOCATION = os.environ.get('MODEL_FILE',"./models/")


# a very simple tokenizer that splits on white space and gets rid of some punctuation
def tokenize(text):
    # for each token in the text (the result of text.split(),
    # apply a function that strips punctuation and converts to lower case.
    tokens = map(lambda x: x.strip(',.&').lower(), text.split())
    # get rid of empty tokens
    tokens = list(filter(None, tokens))
    return tokens

def sentiment(text):
    tokens = tokenize(text)
    if len(tokens):
        bow = YELP_DICTIONARY.doc2bow(tokens)
        x = {}
        for indx, v in YELP_TFIDF[bow]:
            x[indx + 1] = v
        x0, max_idx = gen_feature_nodearray(x)
        label = liblinear.predict(YELP_MODEL, x0)
        return label
    return None