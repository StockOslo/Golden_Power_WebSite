
import unittest
from  Golden_Power.forms.useful_articles import  is_valid_email, is_valid_url




class TestAddArticleLogic(unittest.TestCase):
    def setUp(self):
        self.articles = []

    def mock_load_articles(self):
        return self.articles.copy()

    def mock_save_article(self, new_entry):
        self.articles.append(new_entry)

    def can_add_article(self, author, email):
        # Запрещаем, если есть статья с таким email, но другим author
        for entry in self.articles:
            if entry['email'].lower() == email.lower() and entry['author'] != author:
                return False
        return True

    def test_article_add_and_author_check(self):
        # Первый пользователь, первая статья
        new_entry1 = {
            "author": "John Smith",
            "email": "john.smith@example.com",
            "created_at": "2025-05-23",
            "article": {
                "title": "Python for Beginners",
                "image_url": "https://example.com/python.png",
                "link": "https://example.com/python",
                "description": "Learn Python programming easily."
            }
        }
        if self.can_add_article(new_entry1['author'], new_entry1['email']):
            self.mock_save_article(new_entry1)
        self.assertEqual(len(self.articles), 1)

        # Тот же email, тот же автор — новая статья разрешена
        new_entry2 = {
            "author": "John Smith",
            "email": "john.smith@example.com",
            "created_at": "2025-05-23",
            "article": {
                "title": "Advanced Python",
                "image_url": "https://example.com/advpython.png",
                "link": "https://example.com/advpython",
                "description": "Deep dive into Python."
            }
        }
        if self.can_add_article(new_entry2['author'], new_entry2['email']):
            self.mock_save_article(new_entry2)
        self.assertEqual(len(self.articles), 2)

        # Тот же email, другой автор — не добавляется
        new_entry3 = {
            "author": "Alice Johnson",
            "email": "john.smith@example.com",
            "created_at": "2025-05-23",
            "article": {
                "title": "Python Tips",
                "image_url": "https://example.com/tips.png",
                "link": "https://example.com/tips",
                "description": "Useful Python tricks."
            }
        }
        result = self.can_add_article(new_entry3['author'], new_entry3['email'])
        self.assertFalse(result, "Should not allow different author for same email")
        if result:
            self.mock_save_article(new_entry3)
        self.assertEqual(len(self.articles), 2)

        # Новый email, новый автор — разрешено
        new_entry4 = {
            "author": "Alice Johnson",
            "email": "alice.johnson@example.com",
            "created_at": "2025-05-23",
            "article": {
                "title": "Flask Guide",
                "image_url": "https://example.com/flask.png",
                "link": "https://example.com/flask",
                "description": "Build web apps with Flask."
            }
        }
        if self.can_add_article(new_entry4['author'], new_entry4['email']):
            self.mock_save_article(new_entry4)
        self.assertEqual(len(self.articles), 3)


# Тесты для email-паттерна
class TestEmailPattern(unittest.TestCase):
    def test_email_pattern_valid(self):
        valid_emails = [
            "john.doe@example.com",
            "user_123@sub.domain.co.uk",
            "alice+bob@university.edu",
            "my-mail@info.org",
            "first.last@company.biz",
            "bob@something.io",
            "student99@mit.edu",
            "team-lead@project.net",
            "special!char@site.com",
            "somebody@school.us",
            "unique_user@brand.travel",
            "valid_email123@very-long-domain-name.info",
            "user.test@localhost.com",
            "with-dash@abc-def.com",
            "capitalLETTERS@DOMAIN.com"
        ]
        for email in valid_emails:
            self.assertTrue(is_valid_email(email), f"Should be valid: {email}")

    def test_email_pattern_invalid(self):
        invalid_emails = [
            "john..doe@example.com",
            "user@.com",
            ".username@yahoo.com",
            "username@yahoo.com.",
            "user@@site.com",
            "user@site..com",
            "user@site,com",
            "user@site",
            "user site@domain.com",
            "user@",
            "a@b..com",
            "thislocalpartiswaytoolongforarealemailsystemandshouldfailbecauseitisover64characters@example.com",
            "missingatsign.com",
            "just@one@sign.com"
        ]
        for email in invalid_emails:
            self.assertFalse(is_valid_email(email), f"Should be invalid: {email}")


# Тесты для url-паттерна
class TestUrlPattern(unittest.TestCase):
    def test_url_pattern_valid(self):
        valid_urls = [
            "https://example.com",
            "http://localhost:8000/test",
            "https://sub.domain.co.uk/page?query=1",
            "http://127.0.0.1:5000/",
            "https://my-site.org/resource",
            "http://abc.xyz",
            "https://example.com:8080",
            "http://192.168.1.2/path",
            "https://test-site.net/blog/article",
            "http://example.com/index.html"
        ]
        for url in valid_urls:
            self.assertTrue(is_valid_url(url), f"Should be valid: {url}")

    def test_url_pattern_invalid(self):
        invalid_urls = [
            "ftp://example.com",
            "htp://wrong.com",
            "example.com",
            "://example.com",
            "http://",
            "https:/example.com",
            "http://exa mple.com",
            "http://.com",
            "http:///test.com",
            "https://"
        ]
        for url in invalid_urls:
            self.assertFalse(is_valid_url(url), f"Should be invalid: {url}")
