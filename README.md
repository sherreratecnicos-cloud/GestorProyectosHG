# GestorProyectosHG - iOS template (XcodeGen + Fastlane)

Plantilla mínima de app iOS (SwiftUI) preparada para compilar en **GitHub Actions** sin necesidad de tener **Xcode instalado localmente**.
La plantilla utiliza **XcodeGen** para generar el proyecto Xcode desde `project.yml`, y **Fastlane** para construir y exportar el `.ipa`.

## Qué incluye
- `project.yml` (XcodeGen spec)
- `Sources/GestorProyectosHG` (SwiftUI app: App.swift + ContentView.swift + Info.plist)
- `Fastlane/` (Fastfile, Appfile, Gemfile)
- `.github/workflows/ios-ci.yml` — workflow que genera el proyecto y ejecuta `fastlane ci_build`

## Flujo en CI
1. GitHub Actions ejecuta el workflow en `macos-latest`.
2. Instala `xcodegen` y genera `GestorProyectosHG.xcodeproj`.
3. Instala `fastlane` y ejecuta la lane `ci_build`.
4. `fastlane` construye y exporta un `.ipa` en `./build`. El workflow sube ese `.ipa` como artifact.

> Nota: este repositorio genera un **.ipa sin firmar** por defecto en la lane `ci_build`. Si quieres generar un `.ipa` firmado y subir a TestFlight con la lane `release`, deberás configurar los secretos y certificados en GitHub (ver más abajo).

## Requisitos para CI
- macOS runner (GitHub-hosted `macos-latest`)
- Xcode (provisto por el runner)
- `xcodegen` (instalado por el workflow)
- `fastlane` (instalado por el workflow)

## Secrets recomendados (para firma y TestFlight)
Para la lane `release` y firma automática, crea estos secretos en el repo (Settings → Secrets and variables → Actions):
- `APP_STORE_CONNECT_API_KEY` (JSON content of App Store Connect API Key) — opcional
- `APPLE_CERT_P12` (base64 encoded .p12 certificate) — optional if using match/API
- `APPLE_CERT_PASSWORD` (password for the .p12)
- `MOBILEPROVISION_BASE64` (base64 of provisioning profile)
- `MATCH_PASSWORD` (if using fastlane match)
- `FASTLANE_SESSION` (optional, for session-based auth)

### Cómo codificar un archivo a base64 (ejemplo)
```bash
base64 -i certificate.p12 | pbcopy
# Then paste into GitHub Secret APPLE_CERT_P12
```

## Cómo usar localmente (opcional)
Si quieres probar localmente y tienes Xcode instalado:
1. Instala XcodeGen (`brew install xcodegen`)
2. Ejecuta `xcodegen generate`
3. Abre `GestorProyectosHG.xcodeproj` en Xcode
4. Construye y ejecuta la aplicación

## Sobre el bundle id y Apple ID
- Bundle ID usado en esta plantilla: `es.hg.gestorproyectos`
- Apple ID configurado en `Fastlane/Appfile`: `sherrera.tecnicoshg@gmail.com`

---

Si quieres que genere también:
- Un repo Git inicial con un `git init` y commit (y lo suba a un ZIP listo),
- O que añada un `fastlane Match` + ejemplo de script para instalar certificados automáticamente,
dímelo y lo incluyo.

