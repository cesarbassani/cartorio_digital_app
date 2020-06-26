class Servico {
  String id;
  String tipoServicoId;
  String descricao;
  String status;
  String situacao;
  double valor;
  Null deletedAt;
  String createdAt;
  String updatedAt;
  List<Documentos> documentos;
  TipoServico tipoServico;

  Servico(
      {this.id,
        this.tipoServicoId,
        this.descricao,
        this.status,
        this.situacao,
        this.valor,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
        this.documentos,
        this.tipoServico});

  Servico.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tipoServicoId = json['tipo_servico_id'];
    descricao = json['descricao'];
    status = json['status'];
    situacao = json['situacao'];
    valor = json['valor'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['documentos'] != null) {
      documentos = new List<Documentos>();
      json['documentos'].forEach((v) {
        documentos.add(new Documentos.fromJson(v));
      });
    }
    tipoServico = json['tipo_servico'] != null
        ? new TipoServico.fromJson(json['tipo_servico'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tipo_servico_id'] = this.tipoServicoId;
    data['descricao'] = this.descricao;
    data['status'] = this.status;
    data['situacao'] = this.situacao;
    data['valor'] = this.valor;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.documentos != null) {
      data['documentos'] = this.documentos.map((v) => v.toJson()).toList();
    }
    if (this.tipoServico != null) {
      data['tipo_servico'] = this.tipoServico.toJson();
    }
    return data;
  }
}

class Documentos {
  String id;
  String descricao;
  Null deletedAt;
  String createdAt;
  String updatedAt;
  Pivot pivot;

  Documentos(
      {this.id,
        this.descricao,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
        this.pivot});

  Documentos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    descricao = json['descricao'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['descricao'] = this.descricao;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pivot != null) {
      data['pivot'] = this.pivot.toJson();
    }
    return data;
  }
}

class Pivot {
  String servicoId;
  String documentoId;

  Pivot({this.servicoId, this.documentoId});

  Pivot.fromJson(Map<String, dynamic> json) {
    servicoId = json['servico_id'];
    documentoId = json['documento_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['servico_id'] = this.servicoId;
    data['documento_id'] = this.documentoId;
    return data;
  }
}

class TipoServico {
  String id;
  String descricao;
  String tempoAtendimento;
  Null deletedAt;
  String createdAt;
  String updatedAt;

  TipoServico(
      {this.id,
        this.descricao,
        this.tempoAtendimento,
        this.deletedAt,
        this.createdAt,
        this.updatedAt});

  TipoServico.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    descricao = json['descricao'];
    tempoAtendimento = json['tempo_atendimento'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['descricao'] = this.descricao;
    data['tempo_atendimento'] = this.tempoAtendimento;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
