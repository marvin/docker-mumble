all:
	@echo "make cloud-build will submit the build to Google Cloud Builder"

cloud-build:
	gcloud container builds submit . --config cloudbuild.yaml

.PHONY: cloud-build
