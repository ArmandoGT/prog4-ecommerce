from django.views.generic import TemplateView, ListView, DetailView
from .models import Produto, Categoria
from carrinho.forms import CarrinhoForm


class HomeView(TemplateView):
    template_name = "index.html"

    def get_context_data(self, **kwargs):
        cont = super().get_context_data(**kwargs)
        cont["prods"] = Produto.disponiveis.all().order_by("?")[:3]
        return cont


class ProdutoDetailView(DetailView):
    model = Produto
    template_name = "produtos/produto.html"
    context_object_name = "produto"

    def get_context_data(self, **kwargs):
        cont = super().get_context_data(**kwargs)
        cont["formadd"] = CarrinhoForm()
        return cont




class ProdutoListView(ListView):
    model = Produto
    template_name = "produtos/listarprodutos.html"
    context_object_name = "produtos"
    queryset = Produto.disponiveis.all()

    def get_queryset(self):
        qs = super().get_queryset()
        if self.kwargs and self.kwargs["slugcat"]:
            categ = Categoria.objects.get(slug=self.kwargs["slugcat"])
            qs = qs.filter(categoria=categ)
        return qs

    def get_context_data(self, **kwargs):
        contexto = super().get_context_data(**kwargs)
        contexto["categorias"] = Categoria.objects.all()
        return contexto

