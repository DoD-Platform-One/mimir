  describe('Mimir Test', 
    {
      retries:
      {
        runMode: 2,
      }
    }, () => {
    Cypress.on('uncaught:exception', (err, runnable) => {
      return false
    })

    it('Check if Mimir is available as a data source in Grafana and connected', {retries: 7}, function() {
        cy.wait(10000); 
      const saveOutputOptions = ['Data source is working', 'Data source successfully connected', 'Successfully connected to', 'Successfully queried']
      const saveOutput = new RegExp(`${saveOutputOptions.join('|')}`, 'g')

      cy.visit(Cypress.env('grafana_url'))
    .then(() => {
      // Check if the URL contains '/login'
      cy.url().then(currentUrl => {
        if (currentUrl.includes('/login')) {
          // Perform login if the URL contains '/login'
          cy.performGrafanaLogin('admin', 'prom-operator');
        }
      });
    });

      // Visit the datasources page
      cy.visit(`${Cypress.env('grafana_url')}/connections/datasources`)

      // // // Enter 'mimir' in the search field and 
      cy.get('input[type="text"]').first()
      .type('mimir')
      // Click on the Mimir datasource
      cy.get('a').contains("Mimir").click()
      // Click on the 'Save & test` button
      cy.get('button[type="submit"]').click()
      // Check to ensure the data source is working
      cy.get('[data-testid="data-testid Alert success"]', { timeout: 30000 }).contains(saveOutput)
    })

    // it('Test for Mimir Dashboard log data', function () {
    //     cy.visit(`${Cypress.env('grafana_url')}/dashboards`); 
    //     cy.wait(1000);
    //     cy.loadGrafanaDashboard("Mimir Dashboard quick search");
    //     cy.wait(1000);
    //     cy.get('[data-testid*="data-testid Dashboard template variables Variable Value DropDown value link text"]').first().click()
    //     cy.get('[data-testid="data-testid Select option"]').each(($option) => {
    //         // loop over namespace sub-menu options and select istio-system if found
    //       if ($option.text().includes('istio-system')) {
    //         cy.get($option).click()
    //       } 
    //     }
    //   )
    //     cy.get('[class$=-logs-row]').should('have.length.at.least', 10);
    //   });
})
