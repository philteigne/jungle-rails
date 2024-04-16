const configYargs = require("webpack-cli/bin/config/config-yargs");

describe("Add to cart", () => {
  it('Load the home page', () => {
    cy.visit('/');
  });
  it('Clicks on product and loads details page', () => {
    cy.get('.products article').eq(0).find('.btn').click({force: true});
    cy.get('[data-test-id="cart"]').contains("1");
  });
})