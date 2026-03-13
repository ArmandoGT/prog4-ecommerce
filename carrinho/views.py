from django.shortcuts import redirect
from django.urls import reverse_lazy
from django.views import View
from django.views.generic import TemplateView, FormView

from carrinho.car import Carrinho
from catalogo.models import Producto
from .forms import CarrinhoForm

class CarrinhhoAddProdutoView(FormView):
    form_class = CarrinhoForm
    success_url = reverse_lazy('listarprodutos')

    def post(self, request, *args, **kwargs):
        self.producto = Producto.disponivel.get(id=kwargs['idProducto'])
        return super(CarrinhhoAddProdutoView, self).post(request, *args, **kwargs)

    def form_valid(self, form):
        cd = form.cleaned_data
        carrinho = Carrinho(self.request)
        carrinho.addProducto(producto=self.producto, quant=cd['quant'], alterarquant=cd['alterarquant'])
        return super().form_valid(form)

    def form_invalid(self, form):
        return redirect('listarprodutos')

class RemoverProductoCarrinhoView(View):
    def post(self, request, *args, **kwargs):
        self.producto = Producto.disponivel.get(id=kwargs['idProducto'])
        carrinho = Carrinho(self.request)
        carrinho.removerProducto(self.producto)
        return redirect('vercarrinho')

class VerCarrinhoTemplateView(TemplateView):
    template_name = 'carrinho/detalhe.html'

    def get_context_data(self, **kwargs):
        context = super(VerCarrinhoTemplateView, self).get_context_data(**kwargs)
        carrinho = Carrinho(self.request)
        for item in carrinho:
            item["formalterar"] = CarrinhoForm(
                initial={"quant": item["quantidade"], "alterar": True}
            )

        context["carrinho"] = carrinho
        return context