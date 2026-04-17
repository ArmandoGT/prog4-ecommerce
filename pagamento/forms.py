from django import forms


class NonceForm(forms.Form):
    payment_method_nonce = forms.CharField(
        max_length=1000,
        widget=forms.widgets.HiddenInput,
        required=False
    )

    def clean(self):
        self.cleaned_data = super().clean()
        if not self.cleaned_data.get('payment_method_nonce'):
            raise forms.ValidationError("Não foi possível processar o pagamento")
        return self.cleaned_data