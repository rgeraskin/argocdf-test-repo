# plain-app

A PLAIN OCI artifact — not a helm chart. Bootstrap tars `manifests/` and pushes it as a single `application/vnd.oci.image.layer.v1.tar+gzip` layer under a config media type that is NOT helm's, which is what sends ArgoCD's OCI client down its non-helm extraction path: the layer's contents land at the extraction ROOT with no top-level directory stripped (a `helm push`ed chart gets its single root directory removed instead).

`case/plain-oci-artifact` renders it with `path: manifests`, so the case fails if that layout ever changes — and it is the only place argocdf's own `DefaultOCILayerMediaTypes` gets its non-helm entries exercised.
