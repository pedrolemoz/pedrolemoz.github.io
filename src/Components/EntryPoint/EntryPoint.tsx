import { useEffect, useState } from "react";
import { PersonDataStatus } from "../../Reactivity/PersonDataStatus";
import { copyWith, PersonDataState } from "../../Reactivity/PersonDataState";
import { personDataFromJSON } from "../../Adapters/PersonDataAdapter";
import BasicInfo from "../BasicInfo/BasicInfo";
import DetailedInfo from "../DetailedInfo/DetailedInfo";
import "./EntryPoint.css";

export default function EntryPoint() {
  const [state, changeState] = useState<PersonDataState>({
    data: null,
    status: PersonDataStatus.Initial,
  });

  const getPersonData = async () => {
    changeState(copyWith(state, { status: PersonDataStatus.Processing }));

    const url =
      "https://raw.githubusercontent.com/pedrolemoz/pedrolemoz.github.io/refs/heads/master/assets/pedrolemoz.json";
    const response = await fetch(url);

    if (response.status != 200) {
      changeState(copyWith(state, { status: PersonDataStatus.Error }));
      return;
    }

    const decodedResponse = await response.json();
    const personData = personDataFromJSON(decodedResponse);

    changeState(
      copyWith(state, { status: PersonDataStatus.Success, data: personData })
    );
  };

  useEffect(() => {
    getPersonData();
  }, []);

  if (state.status == PersonDataStatus.Initial) {
    return <h1>initial</h1>;
  }

  if (state.status == PersonDataStatus.Processing) {
    return <h1>processing</h1>;
  }

  if (state.status == PersonDataStatus.Error) {
    return <h1>error</h1>;
  }

  return (
    <div className="entryPoint">
      <div className="sections">
        <BasicInfo personData={state.data!} />
        <Separator />
        <DetailedInfo personData={state.data!} />
      </div>
    </div>
  );
}

function Separator() {
  return <div className="separator"></div>;
}
