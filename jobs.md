# Example Kubernetes Jobs

```
$ kubectl run web --image=web:1 \
  --restart=Never --attach --rm \
  --env="POSTGRES_PASSWORD=my-secret-pw" \
  -- python manage.py migrate
```

```
$ kubectl run busybox --image=busybox \
    --restart=Never --attach --rm --nslookup kubernetes.default
```
