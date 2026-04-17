from django.urls import path

from . import views

urlpatterns = [
    path('', views.VerCarrinhoTemplateView.as_view(),
         name='vercarrinho'),
    path('add/produto/<int:idprod>/',
         views.CarrinhoAddProdutoView.as_view(),
         name='addproduto'),
    path('remover/produto/<int:idprod>/',
         views.RemoverProdutoCarrinhoView.as_view(),
         name='removerproduto'),
]
