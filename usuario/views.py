from django.contrib import messages
from django.contrib.auth.models import Group
from django.shortcuts import get_object_or_404
from django.urls import reverse_lazy
from django.views.generic import CreateView
from .forms import CadUsuarioForm


class UsuarioCreateView(CreateView):
    template_name = 'usuario/cadusuario.html'
    form_class = CadUsuarioForm
    success_url = reverse_lazy("loginuser")

    def form_valid(self, form):
        form.cleaned_data
        grupo = get_object_or_404(Group, name="clientes")
        usuario = form.save()
        usuario.groups.add(grupo)
        messages.success(self.request, "Usuario cadastrado com sucesso")
        return super().form_valid(form)

    def form_invalid(self, form):
        messages.error(self.request, "Erro ao cadastrar")
        return super().form_invalid(form)