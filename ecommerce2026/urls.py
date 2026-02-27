from django.contrib import admin
from django.urls import path, include
from django.conf import settings # Importa as configurações do seu settings.py
from django.conf.urls.static import static # Função para servir arquivos estáticos/mídia

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('catalogo.urls')),
]

# Adiciona o suporte a arquivos de mídia apenas durante o desenvolvimento (DEBUG=True)
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)