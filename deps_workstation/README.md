Chrome only prompts for certificate trust on the initially loaded domain,
but will not prompt for resources/elements.  This will lead to silent failures:

e.g.

    Browser GET: https://localhost:8080
        <cert trust prompt will appear>
    page body:
        <script defer src="https://localhost:3000/static/js/bundle.js"></script>
    Browser GET: https://localhost:3000/static/js/bundle.js
        <no cert trust prompt is presented for referenced URLs that are automatically fetched>