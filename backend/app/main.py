import os
import time
from typing import Optional, List

from firebase_admin import credentials, storage as firebase_storage, initialize_app, auth
from google.cloud import storage as google_storage

from fastapi import FastAPI, Header

from multi_calendar import MultiCalendar

credentials = credentials.Certificate("credentials.json")
initialize_app(credentials, {"storageBucket": "gs://hacked-a28ae.appspot.com"})
bucket = firebase_storage.bucket()
client = google_storage.Client()

app = FastAPI()


@app.get("/process")
def process_calendars(calendars: List[str], start: Optional[str] = None, end: Optional[str] = None,
                      authorization: Optional[str] = Header(None)):
    token = authorization.split(" ")[1]
    decoded_token = auth.verify_id_token(token)

    downloads = []
    for calendar in calendars:
        blob = google_storage.Blob(calendar, bucket)
        download = os.path.join("/data", calendar)
        blob.download_to_filename(download)
        downloads.append(download)

    timestamp = time.time()
    filename = decoded_token['uid'] + "_" + str(timestamp) + ".jpg"
    output = str(os.path.join("/data", filename))

    processor = MultiCalendar(start, end, downloads)
    processor.plot_time_summary(output)

    upload_blob = bucket.blob(filename)
    upload_blob.upload_from_filename(filename)

    return {"data": filename}
