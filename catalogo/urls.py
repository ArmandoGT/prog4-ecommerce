from django.urls import path
from catalogo import views

urlpatterns = [
    path('', views.HomeView.as_view(), name='home'),
    path('produto/<slug:slug>/', views.ProdutoDetailView.as_view(), name='produto_detalhe'),
    path('listarprodutos/<slug:catslug>/', views.ProdutoListView.as_view(), name='listarprodutos'),]