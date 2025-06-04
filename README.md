    # TikTok Sentiment Analysis

A Django-based web application for analyzing sentiments of TikTok video comments. The application scrapes comments from a TikTok video URL, performs sentiment analysis using a pre-trained BERT model, visualizes results with pie and bar charts, and stores data in a database and CSV files.

## Features

- **Comment Scraping**: Extracts comments from TikTok videos using Playwright.
- **Sentiment Analysis**: Classifies comments as Positive, Neutral, or Negative using a BERT model.
- **Data Visualization**: Generates pie charts for sentiment distribution and bar charts for word frequency.
- **Data Management**: Stores results in a database (`Dokument` and `AnalysisResult` models) and CSV files, with options to view, update, or delete entries.
- **File Cleanup**: Deletes associated CSV and chart files from local storage when a record is removed.

## Requirements

- Python 3.8+
- Django 4.2+
- Playwright
- PyTorch
- Transformers (Hugging Face)
- Pandas, NumPy, Matplotlib, Seaborn
- Pillow
- Mysqlclient

## Installation

1. **Clone the Repository**:

   ```bash
   git clone https://github.com/reskyagus21/AnalisisSentimentTiktok.git
   cd tiktok-sentiment-analysis
   ```

2. **Set Up a Virtual Environment**:

   ```bash
   python -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   ```

3. **Install Dependencies**:

   ```bash
   pip install django pillow torch transformers playwright pandas numpy matplotlib seaborn
   playwright install
   ```

4. **Configure the Project**:

   - Update `settings.py` to set `MEDIA_ROOT` and `MEDIA_URL`:

     ```python
     MEDIA_URL = '/media/'
     MEDIA_ROOT = os.path.join(BASE_DIR,'media')
     ```
   - Ensure `urls.py` serves media files:

     ```python
     from django.conf import settings
     from django.conf.urls.static import static
     urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
     ```

5. **Apply Migrations**:

   ```bash
   python manage.py makemigrations
   python manage.py migrate
   ```

6. **Set Up the BERT Model**:

   - Download the pre-trained BERT model and place it in `sentiment/models/bert-sentiment/`.
   - Alternatively, update `MODEL_PATH` in `views.py` to use a different model.

7. **Run the Development Server**:

   ```bash
   python manage.py runserver
   ```

## Usage

1. **Access the Application**:

   - Open `http://localhost:8000` in your browser.

2. **Analyze Comments**:

   - Go to the "Input URL" tab.
   - Enter a TikTok video URL.
   - Click "Analisis" to scrape comments, analyze sentiments, and view results.

3. **View Results**:

   - In the "Hasil Analisis" tab, see sentiment distribution (pie chart), word frequency (bar chart), and a table of comments with sentiments.

4. **Manage Data**:

   - In the "Kelola CSV" tab, view stored records, update video URLs, view analysis results, or delete entries (which also removes associated local files).

## Contributing

Contributions are welcome! Please fork the repository, create a feature branch, and submit a pull request.

## License

This project is licensed under the MIT License.

## Acknowledgments

- Built with Django, Playwright, and Transformers.
- Inspired by sentiment analysis research and TikTok's social media influence.
