-- CreateTable
CREATE TABLE "Ordinateur" (
    "tag" TEXT NOT NULL,
    "modele" TEXT NOT NULL,
    "fabriquant" TEXT,

    CONSTRAINT "Ordinateur_pkey" PRIMARY KEY ("tag")
);

-- CreateTable
CREATE TABLE "Session" (
    "id" TEXT NOT NULL,
    "annee" INTEGER NOT NULL,
    "type" TEXT NOT NULL,

    CONSTRAINT "Session_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Cohorte" (
    "code" TEXT NOT NULL,
    "descrption" TEXT NOT NULL,
    "idSession" TEXT NOT NULL,

    CONSTRAINT "Cohorte_pkey" PRIMARY KEY ("code")
);

-- CreateTable
CREATE TABLE "Apprenant" (
    "matricule" TEXT NOT NULL,
    "prenom" TEXT NOT NULL,
    "nom" TEXT NOT NULL,
    "postnom" TEXT NOT NULL,
    "dateNaissance" TIMESTAMP(3) NOT NULL,
    "addresse" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "telephone" TEXT NOT NULL,
    "tag_ordinateur" TEXT NOT NULL,
    "code_cohorte" TEXT NOT NULL,

    CONSTRAINT "Apprenant_pkey" PRIMARY KEY ("matricule")
);

-- CreateTable
CREATE TABLE "Coach" (
    "matricule" TEXT NOT NULL,
    "prenom" TEXT NOT NULL,
    "nom" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "telephone" TEXT NOT NULL,
    "addresse" TEXT NOT NULL,
    "code_cohorte" TEXT NOT NULL,

    CONSTRAINT "Coach_pkey" PRIMARY KEY ("matricule")
);

-- CreateIndex
CREATE UNIQUE INDEX "Ordinateur_modele_key" ON "Ordinateur"("modele");

-- AddForeignKey
ALTER TABLE "Cohorte" ADD CONSTRAINT "Cohorte_idSession_fkey" FOREIGN KEY ("idSession") REFERENCES "Session"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Apprenant" ADD CONSTRAINT "Apprenant_tag_ordinateur_fkey" FOREIGN KEY ("tag_ordinateur") REFERENCES "Ordinateur"("tag") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Apprenant" ADD CONSTRAINT "Apprenant_code_cohorte_fkey" FOREIGN KEY ("code_cohorte") REFERENCES "Cohorte"("code") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Coach" ADD CONSTRAINT "Coach_code_cohorte_fkey" FOREIGN KEY ("code_cohorte") REFERENCES "Cohorte"("code") ON DELETE RESTRICT ON UPDATE CASCADE;
