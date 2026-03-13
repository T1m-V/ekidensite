param(
  [switch]$Force
)

$ErrorActionPreference = "Stop"

$rootDir = Resolve-Path (Join-Path $PSScriptRoot "..")
$targetDir = Join-Path $rootDir "public\images\legacy"

$assets = @(
  @{ file = "race-finish.jpg"; id = "b6b1df_4c958bc77b6b4477a49657950bae6b66~mv2.jpg"; source = "https://www.rotterdamekiden.nl/info" },
  @{ file = "race-exchange.jpg"; id = "b6b1df_e367ff30fdc148d5ad260afd65989a0d~mv2.jpg"; source = "https://www.rotterdamekiden.nl/info" },
  @{ file = "start-line.jpg"; id = "b6b1df_760a82ff34094f3ba40446ea6f9b0deb~mv2.jpg"; source = "https://www.rotterdamekiden.nl/faq" },
  @{ file = "race-pack.jpg"; id = "b6b1df_e99980c44ac5403dbc79695df81eeca3~mv2.jpg"; source = "https://www.rotterdamekiden.nl/info" },
  @{ file = "race-track.jpg"; id = "b6b1df_6888332478dd434093c4c1002e45a1cb~mv2.jpg"; source = "https://www.rotterdamekiden.nl/uitslagen" },
  @{ file = "start-arch.jpg"; id = "b6b1df_bd6ebff1218e49d5b0b9200b0433ac9d~mv2.jpg"; source = "https://www.rotterdamekiden.nl/" },
  @{ file = "registration.jpg"; id = "b6b1df_fdd939a1647847f9b81b9fa53a1e1861~mv2.jpg"; source = "https://www.rotterdamekiden.nl/inschrijven" },
  @{ file = "business-team.jpg"; id = "b6b1df_9c00687bae844d56abbdc4f9f5b48449~mv2.jpg"; source = "https://www.rotterdamekiden.nl/business-run" },
  @{ file = "parcours-map-primary.png"; id = "b5f68f_25304c87928f4f6682b2f8f09db7fb93~mv2.png"; source = "https://www.rotterdamekiden.nl/info" },
  @{ file = "parcours-map-secondary.png"; id = "b5f68f_f78d12d0c29749c0b8aed0e2727024a4~mv2.png"; source = "https://www.rotterdamekiden.nl/info" },
  @{ file = "parcours-traffic.jpg"; id = "1e50d3_b47763bcb231486fac7875ababcc6153~mv2.jpg"; source = "https://www.rotterdamekiden.nl/info" },
  @{ file = "gallery-cover.jpg"; id = "fec82c_499041c7018e4469a58504f0580c46d0~mv2.jpg"; source = "https://www.rotterdamekiden.nl/foto-s-en-videos" }
)

New-Item -ItemType Directory -Path $targetDir -Force | Out-Null

foreach ($asset in $assets) {
  $destination = Join-Path $targetDir $asset.file
  if ((Test-Path $destination) -and -not $Force) {
    Write-Host "Skip $($asset.file) (already exists)"
    continue
  }

  $url = "https://static.wixstatic.com/media/$($asset.id)"
  Invoke-WebRequest `
    -Uri $url `
    -OutFile $destination `
    -UseBasicParsing `
    -Headers @{ "User-Agent" = "Mozilla/5.0 (legacy importer)" }

  Write-Host "Downloaded $($asset.file) from $($asset.source)"
}

Write-Host "Legacy image import complete: $targetDir"
