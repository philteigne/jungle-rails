describe("Selects individual product", () => {
  it('Load the home page', () => {
    cy.visit('/');
  });
  it('Clicks on product and loads details page', () => {
    cy.get('[alt="Scented Blade"]').click();
  });
})