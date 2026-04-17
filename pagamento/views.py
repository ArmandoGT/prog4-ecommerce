from django.shortcuts import get_object_or_404, redirect, reverse

from ecommerce2026 import settings
from pedido.models import Pedido

from django.views.generic import FormView, TemplateView

import braintree
from .forms import NonceForm


class ProcessarPgtoFormView(FormView):
    """
    View para configurar o braintree e realizar o pagamento
    """
    form_class = NonceForm
    template_name =  "pagamento/processar.html"

    def dispatch(self, request, *args, **kwargs):
        braintree_env = braintree.Environment.Sandbox
        braintree.Configuration.configure(
            braintree_env,
            merchant_id=settings.BRAINTREE_MERCHANT_ID,
            public_key=settings.BRAINTREE_PUBLIC_KEY,
            private_key=settings.BRAINTREE_PRIVATE_KEY,
        )
        self.pedido = Pedido.objects.get(id=self.kwargs['idpedido'])
        self.braintree_client_token = braintree.ClientToken.generate({})
        return super().dispatch(request, *args, **kwargs)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['braintree_client_token'] = self.braintree_client_token
        return context


    def form_valid(self, form):
        valor_a_pagar = self.pedido.get_total_geral()
        result = braintree.Transaction.sale(
            {
                "amount":valor_a_pagar,
                "payment_method_nonce":form.cleaned_data["payment_method_nonce"],
                "options": {"submit_for_settlement":True},
            },
        )
        if not result:
            context = self.get_context_data()
            context['form'] = self.get_form(self.get_form_class())
            context['braintree_error'] = "Pagamento não processado!"
            return self.render_to_response(context)
        transaction_id = result.transaction.id
        self.pedido.pago = True
        self.pedido.save()
        return super().form_valid(form)

    def get_success_url(self):
        return reverse('pgtorealizado')


class PgtoRealizadoView(TemplateView):
    template_name = "pagamento/realizado.html"


class PgtoCanceladoView(TemplateView):
    template_name = "pagamento/cancelado.html"

