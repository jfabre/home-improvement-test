import React from 'react';

class Thread extends React.Component {
  render() {
    const imageSize = this.props.imageSize || 32
    const { body, user, created_at } = this.props.data

    return (
      <div className="media"> 
        <img src={user.image} width={imageSize} height={imageSize} alt={user.full_name} className="mr-3 rounded-circle" />

        <div className="media-body"> 
          <h5 className="mt-0">{ user.full_name }</h5>
          <p>{ body }</p>
          <p>{ created_at }</p> 
        </div>
      </div>
    )
  }
}

export default Thread;