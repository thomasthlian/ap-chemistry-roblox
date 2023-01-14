local ChemicalSettings = { }

ChemicalSettings = {
    ["Hydrated Cobalt Complex Ions in Alcohol Solution"] = {
        ["Equation"] = "Heat  +  [Co(H2O)6]2+  +  4 Cl-  ⇌  [CoCl4]2-  +  6 H2O",
        ["Add Acetone (C3H6O)"] = {
            ["Color"] = Color3.fromRGB(100, 100, 200), -- Light Blue
            ["Hypothesis"] = "Acetone removes water's ability to form a complex ion with cobalt. This creates more blue ions and should make the solution blue.",
            ["Dialogue"] = "As Acetone is added to the solution, it forms hydrogen bonds with water which removes its ability to form a complex ion with cobalt. As products decrease, the equilibrium shifts the reaction to create more products. It uses more pink ions to create blue ions.",
        },
        ["Add Silver Nitrate (AgNO3)"] = {
            ["Color"] = Color3.fromRGB(200, 0, 100), -- Pink
            ["PrecipitateColor"] = Color3.fromRGB(230, 230, 230),
            ["Hypothesis"] = "A precipitate will form of AgCl. This removes the Chloride ion, increasing the amount of pink ions and turning the solution pink.",
            ["Dialogue"] = "As silver nitrate is added to the system, a precipitate of AgCl forms using up the chloride ions. As these ions are used, reactants are decreasing and equilibrium shifts to produce more reactants. Blue ions are used to create pink ions.",
        },
        ["Add Salt (NaCl)"] = {
            ["Color"] = Color3.fromRGB(100, 100, 130), -- Slightly Blue
            ["PrecipitateColor"] = Color3.fromRGB(230, 230, 230),
            ["Hypothesis"] = "The Chloride ion from salt is a reactant, which will cause the reaction to form more products.",
            ["Dialogue"] = "NaCl is not very soluble in alcohol. Most of it does not dissolve, but the ions which do shift the equilibrium towards the products. As Chloride ions are being added, there are too many reactants, so pink ions will be used to create blue ions. This causes the color to shift slightly blue.",
        },
        ["Add Water"] = {
            ["Color"] = Color3.fromRGB(200, 0, 100), -- Pink
            ["Hypothesis"] = "As more product is added, more reactants will be created and change the color to pink.",
            ["Dialogue"] = "Adding water shifts the equilibrium to the left side in order to counteract the increase of product and create more reactants. This uses blue ions and adds pink ions.",
        },
        ["Add Heat"] = {
            ["Color"] = Color3.fromRGB(100, 100, 200), -- Light Blue
            ["Hypothesis"] = "Adding heat is like adding a reactant. That results in more products being created, turning the solution being blue.",
            ["Dialogue"] = "Adding heat shifts the equilibrium to the right. Heat is a reactant so more reactants get used up while more products are being created. The pink ions are being used to create blue ions.",
        },
        ["Remove Heat"] = {
            ["Color"] = Color3.fromRGB(200, 0, 100), -- Pink
            ["Hypothesis"] = "Removing heat is like removing a reactant. That results in more reactants being created, turning the solution turning pink.",
            ["Dialogue"] = "Removing heat shifts the equilibrium to the left. The reaction shifts to counteract the change in temperature, attempting to heat itself up by creating more reactants.",
        }
    },
    ["Copper (II) Sulfate and Ammonia"] = {
        ["Equation"] = "Cu2+  +  4 NH3  ⇌  [Cu(NH3)4]2+",
        ["Add Hydrochloric Acid (HCl)"] = {
            ["Color"] = Color3.fromRGB(100, 100, 200), -- Light Blue
            ["Hypothesis"] = "Adding Hydrochloric acid will remove some ammonia which will cause [Cu(NH3)4]2+ to decompose into copper and nitrate, resulting in a lighter blue color.",
            ["Dialogue"] = "The HCl reacts with ammonia to create an ammonium ion which cannot form a complex with copper II. \"Removing\" some ammonia shifts the equilibrium to the left, removing the darker blue colored ion and creating the lighter blue ion at the same time."
        },
        ["Add Ammonia (NH3)"] = {
            ["Color"] = Color3.fromRGB(0, 0, 100), -- Dark Blue
            ["Hypothesis"] = "Adding more ammonia to the solution with the light blue copper precipitate will create a dark blue solution.",
            ["Dialogue"] = "As long as there are more copper II ions for the ammonia to react with, adding more ammonia will remove the precipitate and create a darker blue solution. Adding more ammonia past a dark blue solution makes the solution slightly clearer because ammonia is clear and will not react.",
        },
        ["Add Copper (II) Sulfate"] = {
            ["Color"] = Color3.fromRGB(0, 0, 100), -- Dark Blue
            ["Hypothesis"] = "The solution should turn to a lighter blue as more light blue ions are being introduced. More dark blue ions are also being created, but since there are more Copper II than there are ammonia to form complexes with, it should turn lighter blue.",
            ["Dialogue"] = "The solution shifts to the right as more reactants are being added; however, there aren't enough ammonia ions to overpower the light blue precipitate formed by the complex of copper II ions and water.",
        }
    }
}

return ChemicalSettings