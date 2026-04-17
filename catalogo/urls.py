from django.urls import path
from . import views

urlpatterns = [
    path('', views.HomeView.as_view(), name='home'),
    path('produto/<slug:slug>/', views.ProdutoDetailView.as_view(),
         name='detalheproduto'),
    path('produtos/', views.ProdutoListView.as_view(),
         name='listarprodutos'),
    path('produtos/<slug:slugcat>/', views.ProdutoListView.as_view(),
         name='listarprodutoscat'),
]