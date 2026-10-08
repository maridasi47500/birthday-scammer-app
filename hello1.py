import spacy
import sys

# Load the English model (can be replaced with other languages)
nlp = spacy.load("en_core_web_sm")
#nlp = spacy.load("fr_core_news_sm")

text = "I visited Paris last summer and then traveled to Mount Everest. I've seen the Eiffel Tower."
text = sys.argv[1]
#print(text)

# Process the text
doc = nlp(text)

# Extract place names
places = [ent.text for ent in doc.ents if ent.label_ in ("GPE", "LOC")]

print({"hello": places})

