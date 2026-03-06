from django.urls import path
from catalogo import views

urlpatterns = [
    path('', views.HomeView.as_view(), name='home'),
    path('produto/<slug:slug>/', views.ProdutoDetailView.as_view(), name='produto_detalhe'),

    # Rota 1: Quando o usuário quer ver TODOS os produtos (sem categoria)
    path('listarprodutos/', views.ProdutoListView.as_view(), name='listarprodutos_todos'),

    # Rota 2: Quando o usuário quer filtrar por uma categoria específica
    path('listarprodutos/<slug:catslug>/', views.ProdutoListView.as_view(), name='listarprodutos'),
]