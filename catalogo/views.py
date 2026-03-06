from django.shortcuts import render
from django.views.generic import TemplateView, DetailView, ListView
from .models import Producto, Categoria


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


class ProdutoListView(ListView):
    model = Producto
    template_name = 'produtos/listarprodutos.html'
    context_object_name = 'produtos'
    queryset = Producto.objects.all()

    def get_queryset(self):
        qs = super().get_queryset()
        # Ajustado para "catslug" igual está no urls.py
        if self.kwargs and self.kwargs.get("catslug"):
            categ = Categoria.objects.get(slug=self.kwargs["catslug"])
            qs = qs.filter(categoria=categ)
        return qs

    def get_context_data(self, **kwargs):
        contexto = super().get_context_data(**kwargs)
        contexto['categorias'] = Categoria.objects.all()
        return contexto