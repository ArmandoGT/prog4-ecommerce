from django.shortcuts import redirect
from django.urls import reverse_lazy
from django.views import View
from django.views.generic import TemplateView, FormView

from carrinho.car import Carrinho
from catalogo.models import Produto
from .forms import CarrinhoForm


class CarrinhoAddProdutoView(FormView):
    form_class = CarrinhoForm
    success_url = reverse_lazy('listarprodutos')

    def post(self, request, *args, **kwargs):
        self.produto = Produto.disponiveis.get(id=kwargs['idprod'])
        return super(CarrinhoAddProdutoView, self).post(request, *args, **kwargs)

    def form_valid(self, form):
        cd = form.cleaned_data
        carrinho = Carrinho(self.request)
        carrinho.addProduto(produto=self.produto,
                            quant=cd['quant'],
                            alterarquant=cd['alterar'])
        if cd['alterar']:
            return redirect('vercarrinho')
        return super().form_valid(form)

    def form_invalid(self, form):
        print(form.errors)
        return redirect('listarprodutos')


class RemoverProdutoCarrinhoView(View):

    def post(self, request, *args, **kwargs):
        self.produto = Produto.disponiveis.get(id=kwargs['idprod'])
        carrinho = Carrinho(self.request)
        carrinho.removerProduto(self.produto)
        return redirect('vercarrinho')


class VerCarrinhoTemplateView(TemplateView):
    template_name = 'carrinho/detalhe.html'

    def get_context_data(self, **kwargs):
        context = super(VerCarrinhoTemplateView, self).get_context_data(**kwargs)
        carrinho = Carrinho(self.request)
        for item in carrinho:
            item["form_alterar"] = CarrinhoForm(
                initial={"quant": item["quantidade"], "alterar": True}
            )
        context['carrinho'] = carrinho
        return context
