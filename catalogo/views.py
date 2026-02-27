from django.shortcuts import render
from django.views.generic import TemplateView, DetailView
from .models import Producto

class HomeView(TemplateView):
    template_name = 'index.html'
    def get_context_data(self, **kwargs):
        cont = super(HomeView, self).get_context_data(**kwargs)
        cont['prods'] = Producto.disponiveis.all().order_by('?')[:3]
        return cont

class ProdutoDetailView(DetailView):
    model = Producto
    template_name = 'produtos/detalharproduto.html'
    context_object_name = 'produto'