# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin "stimulus-chartjs", to: "https://ga.jspm.io/npm:stimulus-chartjs@5.0.0/dist/stimulus-chartjs.mjs", preload: true
pin "@kurkle/color", to: "https://ga.jspm.io/npm:@kurkle/color@0.3.2/dist/color.esm.js", preload: true
pin "chart.js/auto", to: "https://ga.jspm.io/npm:chart.js@4.3.3/auto/auto.js", preload: true
pin "tailwindcss-stimulus-components", to: "https://ga.jspm.io/npm:tailwindcss-stimulus-components@4.0.4/dist/tailwindcss-stimulus-components.module.js"
pin_all_from "app/javascript/controllers", under: "controllers"
