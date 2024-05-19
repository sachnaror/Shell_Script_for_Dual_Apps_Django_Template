# Shell_Script_for_Dual_Apps_Django_Template

chmod +x setup_django.sh
./setup_django.sh

------------------------------

Remember to configure Django to recognize your static files. In your settings.py, you'll have something like:

STATIC_URL = '/static/'
STATICFILES_DIRS = [
    os.path.join(BASE_DIR, "static"),
]



------------------------------

And in your project's main urls.py, add the following:

from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    # Your URL patterns
]

if settings.DEBUG:
    urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)

