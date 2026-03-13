from django.urls import path
from . import views

urlpatterns = [
    path('', views.VerCarrinhoTemplateView.as_view(), name='vercarrinho'),
    path('add/producto/<int:idprod>/',views.CarrinhhoAddProdutoView.as_view(), name='addproducto'),
    path('remover/produto/<int:idprod>/',views.RemoverProductoCarrinhoView.as_view(), name='removerproduto'),
]