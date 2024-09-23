from .common import *

DEBUG = False

ALLOWED_HOSTS = ["your-domain.com", "www.your-domain.com"]  # Update with your domain

# Security settings
SECURE_SSL_REDIRECT = True
SESSION_COOKIE_SECURE = True
CSRF_COOKIE_SECURE = True

# Static files
STATIC_ROOT = "/app/staticfiles"
