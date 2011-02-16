Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'Hf8znjuc1CJjhZ0XHq86g', 'zX6snVjCewNmMEv80dwbzoyTDyo8YJZQzz6hWkR93bM'
  provider :facebook, '179733438727073', 'ecf908b7543459d67c82fed552883f44'
  provider :linked_in, '0tGoUACVEtrtrgXYonENzQi2bsAlMvgG5jcNfT76JcW4ZP3HsHbnAhhifrUabdAE', 'tNlefOhgM-0BICdUVcx6380tZpiPAQAUk3qANxuPo4mksd5C5plhrC6a5GdauIoE'
end
