import conect from "../db/conect.js";

async function getAllDoctor() {
  const sql = "select * from DOUTOR;";

  const doctors = await conect.executeQuery(sql, []);

  console.log(doctors);
  if (doctors && doctors.length > 0) {
    return doctors;
  } else {
    return [];
  }
}

async function getIdDoctor(id) {
  console.log("ID PASSADO PELA REQUISIÇÂO=>", id);
  const sql = "select * from DOUTOR where CODIGO = ?";

  const doctors = await conect.executeQuery(sql, [id]);

  console.log(doctors);
  if (doctors && doctors.length > 0) {
    return doctors;
  } else {
    return [];
  }
}

async function addDoctor(NOME, CRO, HORA_ENTRADA, HORA_SAIDA, OBSERVACAO) {
//   console.log(NOME, CRO, HORA_ENTRADA, HORA_SAIDA, OBSERVACAO);
  const sql =
    "INSERT INTO `doutor` ( `NOME`, `CRO`, `HORA_ENTRADA`, `HORA_SAIDA`, `OBSERVACAO`) VALUES (?, ?, ?, ?, ?);";

  const doctors = await conect.executeQuery(sql, [
    NOME,
    CRO,
    HORA_ENTRADA,
    HORA_SAIDA,
    OBSERVACAO,
  ]);
//   console.log(doctors)
    const CODIGO = Number(doctors.insertId)



  return [
    {
      message: "Registro inserido com sucesso",
      data: {
        CODIGO: CODIGO,
        NOME: NOME,
        CRO: CRO,
        HORA_ENTRADA: HORA_ENTRADA,
        HORA_SAIDA: HORA_SAIDA,
        OBSERVACAO: OBSERVACAO,
      },
    },
  ];
}

async function editDoctor(id) {
  console.log("ID PASSADO PELA REQUISIÇÂO=>", id);
  const sql = "select * from DOUTOR where CODIGO = ?";

  const doctors = await conect.executeQuery(sql, [id]);

  console.log(doctors);
  if (doctors && doctors.length > 0) {
    return doctors;
  } else {
    return [];
  }
}

async function delDoctor(id) {
  console.log("ID PASSADO PELA REQUISIÇÂO=>", id);
  const sql = "select * from DOUTOR where CODIGO = ?";

  const doctors = await conect.executeQuery(sql, [id]);

  console.log(doctors);
  if (doctors && doctors.length > 0) {
    return doctors;
  } else {
    return [];
  }
}

export default { getAllDoctor, getIdDoctor, addDoctor, editDoctor, delDoctor };
