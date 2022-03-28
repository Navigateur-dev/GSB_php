<!-- code html de la page-->
<h2 class="text-center">Toutes les demandes de remboursement</h2>

<?php
if (count($lesDemandes) == 0) {
    echo ("Vous n'avez aucune demande");
} else {
?>
    <table class="table table-bordered table-lg">
        <thead class="table-light">
            <tr>
                <th class="col">date de saisie</th>
                <th scope="col">type de frais</th>
                <th scope="col">montant</th>
                <th scope="col">commentaire</th>
                <th scope="col">nom</th>
                <th scope="col">prenom</th>
            </tr>
        </thead>
        <?php foreach ($lesDemandes as $uneDemande) {
            echo ("<tr>");
            echo ("<td>" . $uneDemande->getDateSaisie() . "</td>");
            echo ("<td>" . $uneDemande->getCommentaire()  . "</td>");
            echo ("<td>" . $uneDemande->getMontant() . "</td>");
            echo ("<td>" . $uneDemande->getTypeFrais()->getLibelle() . "</td>");
            echo ("<td>" . $uneDemande->getDelegue()->getNom() . "</td>");
            echo ("<td>" . $uneDemande->getDelegue()->getPrenom() . "</td>");
            echo ("</tr>");
        } ?>
    </table>
<?php
}
?>