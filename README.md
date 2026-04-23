For full information, setup, and documentation, please see the main project README:

[Main README](https://github.com/SinaSys/flutter_go_rest_app/blob/master/README.md)

## Security Note

- Do not commit real API keys to `asset/config/*.json`.
- Use `flutter_dotenv` with `asset/config/.env`.
- Copy from `asset/config/.env.example` and set values:
  - `BACKEND=gorestEnv|springEnv`
  - `BACKEND_URL=...` (optional override)
  - `API_KEY=...` (optional override)
- `--dart-define` still works as fallback when `.env` is empty:
  - `flutter run --dart-define=API_KEY=<your_key>`
  - `flutter run --dart-define=BACKEND_URL=<url>`
