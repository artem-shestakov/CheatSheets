# Ansible

## Vars tips
* Update variables by Jinja2 script
```yaml
vars:
  cert_paths: "\
    {% set _cert_paths=[] %}\
    {% for flag in x509_exporter_flags %}\
      {% if flag.startswith('--watch-file')%}\
        {% set path=flag.split('=')[-1] %}\
          {{ _cert_paths.append({'path': path, 'perm': 'r--'}) }}\
          {{ _cert_paths.append({'path': '/'.join(path.split('/')[:-1]), 'perm': 'r-x'}) }}\
        {% endif %}\
        {% if flag.startswith('--watch-dir')%}\
          {% set path=flag.split('=')[-1] %}\
          {{ _cert_paths.append({'path': path, 'perm': 'r-x'}) }}\
          {% if path.endswith('/') %}\
          {{ _cert_paths.append({'path': path+'*', 'perm': 'r--'}) }}\
          {% else %}\
          {{ _cert_paths.append({'path': path+'/*', 'perm': 'r--'}) }}\
        {% endif %}\
      {% endif %}\
    {% endfor %}\
    {{ _cert_paths|unique }}\
    "
```