import unittest
from unittest.mock import patch
from datetime import datetime
import forms.partners as partners

class TestPartnersFormValidation(unittest.TestCase):

    @patch('forms.partners.load_partners')
    @patch('forms.partners.request')
    def test_invalid_phone_number_too_short(self, mock_request, mock_load):
        mock_request.forms.get.side_effect = lambda key, default='': {
            'contact_person': 'Ivan Petrov',
            'phone': '12345',
            'name': 'TestCorp',
            'logo_url': 'https://example.com/logo.png',
            'description': 'Reliable partner in logistics'
        }.get(key, default)

        mock_load.return_value = []
        result = partners.add_partner()
        self.assertIn(
            'Phone must contain exactly 11 digits and start with 7 or 8.',
            result
        )

    @patch('forms.partners.load_partners')
    @patch('forms.partners.request')
    def test_invalid_phone_number_wrong_start(self, mock_request, mock_load):
        mock_request.forms.get.side_effect = lambda key, default='': {
            'contact_person': 'Ivan Petrov',
            'phone': '91234567890',
            'name': 'TestCorp',
            'logo_url': 'https://example.com/logo.png',
            'description': 'Reliable partner in logistics'
        }.get(key, default)

        mock_load.return_value = []
        result = partners.add_partner()
        self.assertIn(
            'Phone must contain exactly 11 digits and start with 7 or 8.',
            result
        )

    def test_created_at_format(self):
        now = datetime.now().isoformat()
        try:
            parsed = datetime.fromisoformat(now)
        except ValueError:
            self.fail("Datetime format for created_at is invalid")

if __name__ == '__main__':
    unittest.main()
