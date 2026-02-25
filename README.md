# Akash Student Ambassador — Technical Contributions

Deploy a static HTML page on the [Akash Network](https://akash.network) using nginx.

## Files

| File | Purpose |
|------|---------|
| `index.html` | Your static HTML page (replace with your actual content) |
| `Dockerfile` | Builds an nginx container with `index.html` baked in |
| `deploy.yaml` | Akash SDL — choose Option A or Option B (see comments inside) |

---

## Step 1 — Add Your HTML

Replace `index.html` with the contents of your HTML file:

```bash
cp studentambassadorstechnicalcontributions.html index.html
```

---

## Option A — Custom Docker Image (Recommended)

Best for production: the HTML is baked into the container image.

### 1. Build the image

```bash
docker build -t <your-dockerhub-username>/akash-student-ambassador:latest .
```

### 2. Push to Docker Hub

```bash
docker push <your-dockerhub-username>/akash-student-ambassador:latest
```

### 3. Update deploy.yaml

In `deploy.yaml`, replace the `image` field under `services.web`:

```yaml
image: <your-dockerhub-username>/akash-student-ambassador:latest
```

### 4. Deploy on Akash

Use the [Akash Console](https://console.akash.network) or the Akash CLI:

```bash
provider-services tx deployment create deploy.yaml --from <your-wallet>
```

---

## Option B — Fetch HTML from GitHub (No Docker Hub Required)

The container pulls `index.html` directly from this GitHub repo at startup.

### 1. Push index.html to main

```bash
git add index.html
git commit -m "Add HTML page"
git push origin main
```

### 2. Enable Option B in deploy.yaml

Open `deploy.yaml` and:
- Remove (or comment out) the `image: nginx:alpine` line
- Uncomment the `env:` and `command:` blocks

### 3. Deploy on Akash

```bash
provider-services tx deployment create deploy.yaml --from <your-wallet>
```

---

## Resource Defaults

| Resource | Amount |
|----------|--------|
| CPU | 0.5 units |
| Memory | 256 Mi |
| Storage | 512 Mi |
| Price | 1000 uakt |

Adjust these values in the `profiles.compute.web.resources` section of `deploy.yaml` as needed.
