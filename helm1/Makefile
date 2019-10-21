help:
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

index:  ## Index charts
	@helm repo index --url https://imhotepio.github.io/iconoflix-charts docs

icx-go: ## Package go-api
	@helm package icx-go-gql -d docs

icx-ui: ## Package icx-ui
	@helm package icx-ui-gql -d docs