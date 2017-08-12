Rails.configuration.stripe = {
  :publishable_key => 'pk_test_ds0NF8cEMx7H1Ms3gzvqBwbY',
  :secret_key      => 'sk_test_SOkKuUwVulKhmZQKKq6yIn3s'
}
 
Stripe.api_key = Rails.configuration.stripe[:secret_key]