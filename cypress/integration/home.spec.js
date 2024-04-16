describe("Products on Home Page", () => {
  it('Load the home page', () => {
    cy.visit('/');
  });
  it('There is products on the page', () => {
    cy.get('.products article').should("have.length", 2);
  });
})