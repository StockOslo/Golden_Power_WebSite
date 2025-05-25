import unittest
from unittest.mock import patch, mock_open
import json
from datetime import datetime
import forms.reviews as reviews

class TestReviews(unittest.TestCase):
    def setUp(self):
        self.sample_reviews = [{
            'author': 'John Doe',
            'phone': '+12345678901',
            'email': 'john@example.com',
            'date': '2025-05-20',
            'text': 'Great!'
        }]
        self.sample_reviews_json = json.dumps(self.sample_reviews, ensure_ascii=False, indent=2)

    @patch('forms.reviews.open', new_callable=mock_open, read_data='[]')
    def test_load_reviews_empty(self, mock_file):
        reviews_list = reviews.load_reviews()
        self.assertEqual(reviews_list, [])

    @patch('forms.reviews.open', new_callable=mock_open, read_data='[{"author":"Test"}]')
    def test_load_reviews_valid_json(self, mock_file):
        reviews_list = reviews.load_reviews()
        self.assertIsInstance(reviews_list, list)
        self.assertEqual(reviews_list[0]['author'], "Test")

    @patch('forms.reviews.open', new_callable=mock_open)
    def test_save_reviews_calls_write(self, mock_file):
        reviews.save_reviews(self.sample_reviews)
        mock_file().write.assert_called()

    @patch('forms.reviews.load_reviews')
    @patch('forms.reviews.save_reviews')
    @patch('forms.reviews.request')
    def test_add_review_valid(self, mock_request, mock_save, mock_load):
        mock_request.forms.get.side_effect = lambda k, d='': {
            'author': 'Alice Smith',
            'phone': '+123456789012',
            'email': 'alice@example.com',
            'text': 'Nice work!'
        }.get(k, d)

        mock_load.return_value = []

        result = reviews.add_review_TEST(return_dict=True)

        self.assertIn('success', result)
        self.assertTrue(result['success'])
        mock_save.assert_called_once()
        saved_data = mock_save.call_args[0][0]
        self.assertEqual(saved_data[0]['author'], 'Alice Smith')

    @patch('forms.reviews.load_reviews')
    @patch('forms.reviews.request')
    def test_add_review_missing_fields(self, mock_request, mock_load):
        mock_request.forms.get.side_effect = lambda k, d='': {
            'author': '',
            'phone': '+123456789012',
            'email': 'alice@example.com',
            'text': 'Some text'
        }.get(k, d)

        mock_load.return_value = []
        result = reviews.add_review_TEST()
        self.assertIn('error', result)
        self.assertEqual(result['error'], "All fields are required.")

    @patch('forms.reviews.load_reviews')
    @patch('forms.reviews.request')
    def test_add_review_invalid_email(self, mock_request, mock_load):
        mock_request.forms.get.side_effect = lambda k, d='': {
            'author': 'Alice Smith',
            'phone': '+123456789012',
            'email': 'invalid-email',
            'text': 'Some text'
        }.get(k, d)

        mock_load.return_value = []
        result = reviews.add_review_TEST()
        self.assertIn('error', result)
        self.assertEqual(result['error'], "Invalid email address.")

    @patch('forms.reviews.load_reviews')
    @patch('forms.reviews.request')
    def test_add_review_duplicate_email(self, mock_request, mock_load):
        mock_request.forms.get.side_effect = lambda k, d='': {
            'author': 'Bob',
            'phone': '+123456789012',
            'email': 'john@example.com',
            'text': 'Another review'
        }.get(k, d)

        mock_load.return_value = self.sample_reviews
        result = reviews.add_review_TEST()
        self.assertIn('error', result)
        self.assertEqual(result['error'], "You have already submitted a review with this email.")

if __name__ == '__main__':
    unittest.main()
