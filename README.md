# Urban Dictionary Definition Quality

Text classifcation project to predict good, controversial, and bad Urban Dictionary definitions based on the [Urban Dictionary Words and Definitions dataset on Kaggle](https://www.kaggle.com/therohk/urban-dictionary-words-dataset). For these purposes "controversial" means that users gave the definition a mix of good and bad ratings; it does not relate to whether the term being defined or the definition is "controversial" from the perspective of factual correctness or common standards (beyond those expressed by users' votes).


*Note*: By the nature of Urban Dictionary, there are some offensive words, including very harmful slurs, contained in some of the outputs of this project (for example, the exploratory data analysis notebook). I do not promote or condone the use of these words and warn users/readers in advance that these words may be present.

## API

To test the API, you can run

``sh run_docker.sh``

and then interact directly with the API via UI [http://localhost:5001/apidocs/](http://localhost:5001/apidocs/).

The API uses the logistic regression model in models/logistic/best_logistic.p. 

## Repo structure notes

- The DistilBERT model was too large to upload, so it is not available here.
- The underlying data and the final paper itself are also not uploaded here. 
- Each model was trained in its own notebook in the notebooks directory (with appropriate seeds set and artefacts saved to be fully reproducible.)

## References
- API code (api.py, api_entrypoint.sh, Dockerfile, predict.py, run_docker.sh, requirements.txt) are adapted from lecture7.zip 
- SVM and LogisticRegression code are adapted from homework 7
- DistilBERT training is based on [this tutorial](https://huggingface.co/transformers/custom_datasets.html), specifically the IMDb example, with help from the [Trainer section here](https://huggingface.co/transformers/training.html#trainer)