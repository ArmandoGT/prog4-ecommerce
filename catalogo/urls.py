from django.urls import path,include
from catalogo import views

urlpatterns = [
    path('',views.HomeView.as_view(),name='home'),
]